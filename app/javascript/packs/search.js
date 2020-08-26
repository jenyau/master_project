$(document).on('turbolinks:load', function() {
  $("#category").on("change", function(){
    var choice = $(this).val();
    var puff_product = $(".puff_product");
    var biscuits = $(".biscuits");
    var cake = $(".cake");
    var desert = $(".desert");

    switch(choice){
      case "Печенье":
        biscuits.show();
        puff_product.hide();
        cake.hide();
        desert.hide();
      break
      case "Слойка":
        biscuits.hide();
        puff_product.show();
        cake.hide();
        desert.hide();
      break
      case "Торт":
        biscuits.hide();
        puff_product.hide();
        cake.show();
        desert.hide();
      break
      case "Пирожное":
        biscuits.hide();
        puff_product.hide();
        cake.hide();
        desert.show();
      break
      case "Вся продукция":
        biscuits.show();
        puff_product.show();
        cake.show();
        desert.show();
      break

    };
  })
})