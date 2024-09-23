const String kDomain = "https://wahid.servesonic.net";
const String basUrl = "$kDomain/api";
const String imageUrl = "$kDomain/";
//Authentication EndPoints
const String kLoginUrl = "$basUrl/login";
const String kRegisterUrl = "$basUrl/register";

String kUserDataUlr({required int userId}) => "$basUrl/user-data/$userId";

//need for wahid store
const String kFetchCategory = "$basUrl/categories";

String kFetchSubCategory({required int catId}) => "$basUrl/categories/$catId";

String kFetchSubSubCategory({required int subCatId}) =>
    "$basUrl/subcategories/$subCatId";

String kFetchProduct({required int subSubCatId}) =>
    "$basUrl/subsubcategories/$subSubCatId";

const String kCreateOrder = "$basUrl/create-order";

const String kOrderList = "$basUrl/user-orders";
