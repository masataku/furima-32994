window.addEventListener('load', function () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () =>{
    const inputValue = priceInput.value;
    const fee = inputValue / 10;
    const profit = inputValue - Math.floor(fee);
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(fee);
    profitDom.innerHTML = Math.floor(profit);
  });
});
