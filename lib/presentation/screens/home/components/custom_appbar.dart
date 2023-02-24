part of '../home_screen.dart';
_appBar(BuildContext context) => AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          Image.asset(
            ImageAssets.microchip,
            height: AppSize.s40,
            width: AppSize.s40,
          ),
          const SizedBox(
            width: AppSize.s10,
          ),
          Text(
            AppStrings.homeScreenAppBarTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: _notificationButton,
          icon: SvgPicture.asset(
            ImageAssets.notoficationIcon,
            height: AppSize.s28,
            width: AppSize.s28,
          ),
        ),
      ],
    );

void _notificationButton() {}

// _oldAppBar(BuildContext context) => AppBar(
//       title: Row(
//         children: [
//           Image.asset(
//             ImageAssets.microchip,
//             height: AppSize.s40,
//             width: AppSize.s40,
//           ),
//           const SizedBox(
//             width: AppSize.s10,
//           ),
//           Text(
//             AppStrings.homeScreenAppBarTitle,
//             style: Theme.of(context).textTheme.headlineMedium,
//           ),
//         ],
//       ),
//       actions: [
//         IconButton(
//           onPressed: _notificationButton,
//           icon: SvgPicture.asset(
//             ImageAssets.notoficationIcon,
//             height: AppSize.s28,
//             width: AppSize.s28,
//           ),
//         ),
//       ],
//       bottom: PreferredSize(
//         preferredSize: const Size.fromHeight(AppSize.s200),
//         child: SizedBox(
//           height: AppSize.s200,
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   ImageAssets.electricalEnergy,
//                   height: AppSize.s100,
//                   width: AppSize.s100,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     //Todo: change with a flag
//                     Text('${AppStrings.electricity}: ON',
//                         style: Theme.of(context).textTheme.titleMedium),
//                     const SizedBox(
//                       width: AppSize.s10,
//                     ),
//                     //Todo: change with a flag
//                     CircleAvatar(
//                       radius: 4,
//                       backgroundColor: AppColors.green,
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text('${AppStrings.lastPowerCut}: 2023-2-11',
//                         style: Theme.of(context).textTheme.titleMedium),
//                     Text('1 day ago',
//                         style: Theme.of(context).textTheme.titleSmall),
//                   ],
//                 ),
//               ]),
//         ),
//       ),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           bottom: Radius.circular(AppSize.s50),
//         ),
//       ),
//     );