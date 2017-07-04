App.factory("CategoryService", ["Restangular", function(Restangular){

  var CategoryService = {};


  CategoryService.rankCategory = function(category){
  	return Restangular.one('categories', category.id).customPUT({ category: { rank: category.rank += 1}})
        .then(function(response){
           return response;
        });
  };

  CategoryService.rankDrug = function(drug){
  	return Restangular.one('drugs', drug.id).customPUT({ drug: { rank: drug.rank += 1}})
        .then(function(response){
           return response;
        });
  }

  

  return CategoryService;

}]);