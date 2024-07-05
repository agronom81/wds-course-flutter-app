import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../common/app_settings.dart';
import '../../common/utils.dart';
import '../../data/app_constants.dart';
import '../../data/app_path.dart';
import '../../models/product_extra.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/empty.dart';
import '../../widgets/home/home_categories.dart';
import '../../widgets/home/home_products.dart';
import '../../widgets/home/home_slider.dart';
import '../../widgets/loader.dart';
import '../../widgets/search_field.dart';
import 'bloc/home_cubit.dart';
import 'bloc/home_state.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AppSettings settings = AppSettings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (!state.isSuccess) {
            settings.removeToken();
            context.go(AppPath.login);
          }
        },
        child: const HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({
    super.key,
  });

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    var homeState = context.watch<HomeCubit>().state;

    if (homeState.isLoading && homeState.data.isEmpty) {
      return const Loader();
    }

    if (!homeState.isLoading && !homeState.isSuccess) {
      return Center(
        child: Column(
          children: [
            Lottie.asset(
              'animations/error.json',
              repeat: false,
            ),
            const CustomText(
              text: 'Something went wrong!',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return BlocPresentationListener<HomeCubit, HomeEvent>(
      listener: (context, event) {
        if (event is HomeEventError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(event.message)));
        }
      },
      child: SingleChildScrollView(
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
            homeState.data['slider'] != null &&
                    homeState.data['slider'].length > 0
                ? HomeSlider(
                    images: homeState.data['slider'].cast<String>(),
                    dotsBottom: 8,
                  )
                : const Empty(),
            homeState.data['exclusive'] != null &&
                    homeState.data['exclusive'].length > 0
                ? HomeProducts(
                    products: createProductShort(homeState.data['exclusive']),
                    routeName: AppPath.products,
                    blockTitle: 'Exclusive Offer',
                    extra: ProductExtra(
                      type: AppConstants.exclusive,
                      catId: '',
                      title: 'Exclusive Offer',
                    ),
                  )
                : const Empty(),
            homeState.data['best'] != null && homeState.data['best'].length > 0
                ? HomeProducts(
                    products: createProductShort(homeState.data['best']),
                    routeName: AppPath.products,
                    blockTitle: 'Best Selling',
                    extra: ProductExtra(
                      type: AppConstants.bestSell,
                      catId: '',
                      title: 'Best Selling',
                    ),
                  )
                : const Empty(),
            homeState.data['category'] != null &&
                    homeState.data['category'].length > 0
                ? HomeCategories(
                    categories: createCategory(homeState.data['category']),
                  )
                : const Empty(),
          ],
        ),
      ),
    );
  }

  _loadData() {
    context.read<HomeCubit>().loadData();
  }
}
