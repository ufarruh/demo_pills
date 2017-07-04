App.controller("PharmaciesCtrl", ["$scope", 'Restangular', "Auth", "$http", "PharmacyService", "$state", function($scope, Restangular, Auth, $http, PharmacyService, $state){
   

 $scope.popup2 = {
    opened: false
  };


  function disabled(data) {
    var date = data.date,
      mode = data.mode;
    return mode === 'day' && (date.getDay() === 0 || date.getDay() === 6);
  }


   $scope.dateOptions = {
    dateDisabled: disabled,
    formatYear: 'yy',
    maxDate: new Date(2020, 5, 22),
    minDate: new Date(),
    startingDay: 1
  };


  $scope.open2 = function() {
    $scope.popup2.opened = true;
  };


  $scope.passDrug = function(drug){
    $scope.passedDrug = drug;
  };

  

   Auth.currentUser()
      .then(function(user){
         $scope.user = angular.copy(user);
      });


  $scope.pharmacy_drugs = Restangular.all("pharmacies").customGETLIST("pharmacy_drugs").$object;
 
  $scope.newPharmacyForm = {}; 


 	$scope.addDrug = function(drug){
 		$http.post("/api/v1/pharmacies/" + $scope.user.id + "/add", { drug_id: drug.id, price: drug.price, exp_date: drug.exp_date } )
 			.then(function(response){
 				console.log(response);
 			});
 	};	


  $scope.removeDrug = function(drug){
     $http.delete("/api/v1/pharmacies/" + $scope.user.id + "/remove", { params: { drug_id: drug }})
      .then(function(response){
        $scope.pharmacy_drugs = Restangular.all("pharmacies").customGETLIST("pharmacy_drugs").$object;
      });
  };



  $scope.create = function(){
    PharmacyService.create($scope.newPharmacyForm)
      .then(function(response){
        console.log(response);
        $scope.newPharmacyForm = {};
        $state.go("home.new.success");
      });
  };

	
}]);











