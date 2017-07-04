App.controller('CategoriesCtrl', ['$scope', 'Restangular', '$stateParams', 'CategoryService', '$http',function($scope, Restangular, $stateParams, CategoryService, $http){

	
	$scope.category = Restangular.one('categories', $stateParams.id).get().$object;
  $scope.categoriesPerPage = 6;
  $scope.totalCategories = 1053;
  $scope.categories = Restangular.all("categories").getList().$object;

  $http.get("/api/v1/categories/landCats")
    .then(function(response){
      $scope.landCats = response.data
    });

  categoryResultsPage(1);
  drugResultsPage(1);

  $scope.pagination = {
    current: 1
  };

  $scope.categoryPageChanged = function(newPage) {
    categoryResultsPage(newPage);
  };

  

  function categoryResultsPage(pageNumber) {
        
    $http.get("/api/v1/categories.json", { params: { page: pageNumber }})
        .then(function(result) {
            $scope.categories =  result.data;
        });
    };


  $scope.drugPageChanged = function(newPage){
    drugResultsPage(newPage);
   };


  function drugResultsPage(pageNumber) {
        
    $http.get("/api/v1/drugs.json", { params: { page: pageNumber, category: $stateParams.id }})
        .then(function(result) {
          $scope.categoryDrugs =  result.data;
        });
    };



    $scope.rankCategory = function(category){
      return CategoryService.rankCategory(category)
        .then(function(response){
          console.log(response);
        });
    };


    $scope.rankDrug = function(drug){

      return CategoryService.rankDrug(drug)
        .then(function(response){
          console.log(response);
        });
    };


}]);

