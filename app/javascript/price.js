window.addEventListener('load', function(){
  let price = document.getElementById("item-price")
  let tax_price = document.getElementById("add-tax-price")
  let profit = document.getElementById("profit")

  price.addEventListener('keyup', function(){
    value = price.value
    tax_price_value = value * 0.1
    tax_price.innerHTML = tax_price_value
    profit_value = value - tax_price_value
    profit.innerHTML = profit_value
  })
})