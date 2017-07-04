App.controller('DrugsCtrl', ['$scope', "$rootScope", "Auth", 'Restangular', '$stateParams', '$http', '$state', 'CategoryService', "FavoriteService",
                            function($scope, $rootScope, Auth, Restangular, $stateParams, $http, $state, CategoryService, FavoriteService){
    
    
    $scope.drug = Restangular.one('drugs', $stateParams.id).get().$object;
    $scope.drugs = Restangular.all("drugs").getList().$object;
    $scope.categoriesPerPage = 15;
    $scope.totalCategories = 5779;
    

    $scope.searchDrug = function(term){
    	return $http.get('/api/v1/drugs/search', {
    		params: {
    			term: term
    		}
    	}).then(function(response){
        $scope.mobileResult = response.data;
        return response.data;
    	});

    };

  
  drugResultsPage(1);
  
  $scope.pagination = {
    current: 1
  };


    $scope.drugPageChanged = function(newPage){
    drugResultsPage(newPage);
   };


  function drugResultsPage(pageNumber) {
        
    $http.get("/api/v1/drugs.json", { params: { page: pageNumber }})
        .then(function(result) {
          $scope.drugs =  result.data;
        });
    };


    $scope.status = {
        isCustomHeaderOpen: false,
        isFirstOpen: true,
        isFirstDisabled: false
    };


    $scope.favorite = function(drug){
      if($rootScope.signedIn()){
        FavoriteService.favorite(drug)
          .then(function(response){
            console.log(response);
          });
      }else{
        
        $state.go("home.profile");
      }
    };


    $scope.redirectTo = function(drug){
      CategoryService.rankDrug(drug);
      $state.go('home.drugs.show', { id: drug.id });
    };


}]);
