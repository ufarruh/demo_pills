App.filter("shortText", function(){

  return function(text){
    
    if(text.length < 60){
      return text;
    }else {
      var arr = text.split("");
      var result = arr.splice(0, 50);
      var endResult = result.join("") + "...";

      return endResult;
    }
  };


});