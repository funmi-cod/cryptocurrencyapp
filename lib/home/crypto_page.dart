
import 'dart:math';

import 'package:cryptocurrencyapp/blocs/crypto_bloc/crypto_bloc.dart';
import 'package:cryptocurrencyapp/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';


import '../circle_indicator.dart';
import '../components/constants.dart';
import '../components/size_config.dart';




class CryptoPage extends StatefulWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  _CryptoPageState createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  final CryptoBloc _Bloc = CryptoBloc();
  // ignore: prefer_typing_uninitialized_variables
  var result;
  
  double roundDouble(double value, int point){
    num mod = pow(10.0, point);
    return((value * mod).round().toDouble());
  }
  
  String dateFormat(String formatDate) {
    DateTime date = DateTime.parse(formatDate);
    return (DateFormat('H:m MMM d, yyyy').format(date));
  }



  @override
  void initState() {
    // TODO: implement initState
    _Bloc.add(GetCryptoList());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: DefaultTabController(
        length: 4, child: Container(
        height: 50,
        color: kBgColor,
        child: TabBar(
          unselectedLabelColor: kSubTextColor,
          indicator: CircleIndicator(
            color: kTextColor,
            radius: 3,
          ), tabs: const [
          Tab(
            child: FaIcon(FontAwesomeIcons.chartBar,
              color: kTextColor,
              size: 20,
            ),
          ),
          Tab(
            child: FaIcon(FontAwesomeIcons.globe,
              color: kSubTextColor,
              size: 20,
            ),
          ),
          Tab(
            child: FaIcon(FontAwesomeIcons.bell,
              color: kSubTextColor,
              size: 20,
            ),
          ),
          Tab(
            child: FaIcon(FontAwesomeIcons.user,
              color: kSubTextColor,
              size: 20,
            ),
          ),
        ],
        ),
      ),

      ),
      body: Container(
        //color: kPrimaryColor,
        //margin: EdgeInsets.all(getProportionateWidth(20)),
        padding: EdgeInsets.symmetric(horizontal: getProportionateWidth(20)),
        child: BlocProvider(
          create: (_) => _Bloc,
          child: BlocListener<CryptoBloc, CryptoState> (
            listener: (context, state) {
              if (state is CryptoError){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message!, style: textErrorStyle,)),);
              }
            },
            child: BlocBuilder<CryptoBloc, CryptoState>(
              builder: (context, state) {
                if (state is CryptoInitial){
                  return _buildLoading();
                }else if (state is CryptoLoading) {
                  return _buildLoading();
                } else if (state is CryptoLoaded) {
                  return _buildContainer(context, state.data);

                } else if (state is CryptoError) {
                  return Container();
                } else { return Container();
                }
              }),
            ),
          ),
          ),
        );

  }
  Widget _buildContainer (BuildContext context, List<CryptoModel> model){
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateWidth(10.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('History', style: headingStyle,),
              SizedBox(
                child: Row(
                  children:  [
                    Transform.rotate(
                      angle: 90 * pi / 180,
                      child: const FaIcon(FontAwesomeIcons.slidersH, color: kTextColor,),),
                    Text('  Sort/Filter', style: subTextStyle,),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.02,),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: model.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: RichText(
                    text: TextSpan(
                      text: (model[index].currentPrice! - model[index].priceChange_24h!)  < 0? "sent": "received",style: subHeadingStyle,
                      children: [
                        TextSpan(text: "\n${model[index].atl}    ${model[index].name}",style: headingStyle),
                        TextSpan(text: "\n${dateFormat(model[index].lastUpdated!)}", style: subHeadingStyle),
                      ],
                    ),
                  ),
                  leading: Container(
                    height: getProportionateHeight(200),
                    width: getProportionateWidth(60),

                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: kBgColor,),
                    child: Image.network(model[index].image!,fit: BoxFit.contain,width: 40,height: 150,),
                  ),
                  trailing: Text("+\$${result = roundDouble((model[index].currentPrice! - model[index].priceChange_24h!), 2)}", style: result < 0? inactiveTrailStyle: activeTrailStyle,),

                );
              }),
        ),
      ],
    );
  }

  Widget _buildLoading() => const Center(child:  CircularProgressIndicator(color: kTextColor,),);
}
