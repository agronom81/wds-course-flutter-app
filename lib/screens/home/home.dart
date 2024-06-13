import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../common/app_settings.dart';
import '../../common/utils.dart';
import '../../data/app_path.dart';
import '../../widgets/empty.dart';
import '../../widgets/home/home_categories.dart';
import '../../widgets/home/home_products.dart';
import '../../widgets/home/home_slider.dart';
import '../../widgets/loader.dart';
import '../../widgets/search_field.dart';
import 'bloc/home_cubit.dart';

class Home extends StatefulWidget {
  Home({super.key});

  final AppSettings settings = AppSettings();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    var homeState = context.watch<HomeCubit>().state;

    return Scaffold(
      appBar: AppBar(),
      body: homeState.isLoading && homeState.data.isEmpty
          ? const Loader()
          : BlocPresentationListener<HomeCubit, HomeEvent>(
              listener: (context, event) {
                if (event is HomeEventError) {
                  widget.settings.removeToken();
                  context.go(AppPath.login);
                }
              },
              child: HomeContent(
                data: homeState.data,
              ),
            ),
    );
  }

  _loadData() {
    context.read<HomeCubit>().loadData();
  }
}

class HomeContent extends StatelessWidget {
  final Map<String, dynamic> data;

  const HomeContent({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: SvgPicture.asset(
              'icons/carrot.svg',
              height: 40,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: SearchField(),
          ),
          data['slider'] != null && data['slider'].length > 0
              ? HomeSlider(
                  images: data['slider'].cast<String>(),
                  dotsBottom: 8,
                )
              : const Empty(),
          data['exclusive'] != null && data['exclusive'].length > 0
              ? HomeProducts(
                  products: createProductShort(data['exclusive']),
                  routeName: AppPath.explore,
                  blockTitle: 'Exclusive Offer',
                )
              : const Empty(),
          data['best'] != null && data['best'].length > 0
              ? HomeProducts(
                  products: createProductShort(data['best']),
                  routeName: 'explore',
                  blockTitle: 'Best Selling',
                )
              : const Empty(),
          data['category'] != null && data['category'].length > 0
              ? HomeCategories(
                  categories: createCategory(data['category']),
                )
              : const Empty(),
        ],
      ),
    );
  }
}
