App.factory("FavoriteService", ["$http", function($http){

  var FavoriteService = {};


  FavoriteService.favorite = function(drug){
    return $http.post("/api/v1/users/favorite.json", {
      user: { drug_id: drug.id }
    }).then(function(response){
      return response;
    });
  }; 



  FavoriteService.unfavorite = function(drug){
    return $http.post("/api/v1/users/unfavorite.json", {
      user: { drug_id: drug.id }
    })
  }

  return FavoriteService;

}]);