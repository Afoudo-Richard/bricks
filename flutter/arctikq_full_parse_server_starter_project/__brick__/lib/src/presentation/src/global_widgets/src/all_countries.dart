import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:intl_phone_field/countries.dart';

class AllCountries extends StatelessWidget {
  const AllCountries({
    Key? key,
    required this.onTap,
    this.selectedItem,
  }) : super(key: key);

  final void Function(Ctry? country) onTap;
  final Ctry? selectedItem;

  @override
  Widget build(BuildContext context) {
    List<Country> allowedCountries = [
      const Country(
        name: "Cameroon",
        nameTranslations: {},
        flag: "🇨🇲",
        code: "CM",
        dialCode: "237",
        minLength: 9,
        maxLength: 9,
      ),
      const Country(
        name: "Nigeria",
        nameTranslations: {},
        flag: "🇳🇬",
        code: "NG",
        dialCode: "234",
        minLength: 10,
        maxLength: 11,
      ),
    ];
    List<Country> countrys = countries
        .filterListFromOptions(allowedCountries,
            (country, option) => country.dialCode == option.dialCode)
        .toList();

    return SizedBox(
      height: 50.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SectionHeader(
              title: "Select Country",
              trailing: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 20.sp,
                ),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: BlocBuilder<ListCtryBloc, ListCtryState>(
              builder: (context, state) {
                switch (state.listCtryStatus) {
                  case ListCtryStatus.initial:
                  case ListCtryStatus.refresh:
                    return Padding(
                      padding: EdgeInsets.only(
                        left: paddingSize,
                        right: paddingSize,
                        bottom: 10.sp,
                        top: 1.h,
                      ),
                      child: LoadingIndicator(),
                    );
                  case ListCtryStatus.success:
                    return state.ctries.isEmpty
                        ? FetchEmpty(
                            message: "No Countries Found",
                            onPressedRefresh: () {
                              BlocProvider.of<ListCtryBloc>(context).add(
                                const ListCtryFetched(
                                  refresh: true,
                                ),
                              );
                            },
                          )
                        : ListView.separated(
                            padding: pagePadding,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.ctries.length,
                            itemBuilder: (context, index) {
                              final ctry = state.ctries[index];
                              return GestureDetector(
                                onTap: () {
                                  onTap(ctry);
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${ctry.flag} ${ctry.name}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                    selectedItem?.dialCode == ctry.dialCode
                                        ? Row(
                                            children: [
                                              2.w.pw,
                                              CustomCircle(
                                                radius: 20.sp,
                                                child: Center(
                                                  child: Icon(
                                                    Icons.check,
                                                    size: 15.sp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                height: 4.h,
                              );
                            },
                          );
                  case ListCtryStatus.failure:
                    return FetchError(
                      message:
                          "An error occured while trying to fetch countries",
                      onPressedTryAgain: () {
                        BlocProvider.of<ListCtryBloc>(context).add(
                          const ListCtryFetched(
                            refresh: true,
                          ),
                        );
                      },
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
