window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfit = document.getElementById("profit")
    const tax = (inputValue * 0.1)
    addTaxDom.innerHTML = Math.floor(tax)
    const profit = (inputValue * 0.9)
    addProfit.innerHTML = Math.floor(profit);
})
 
});

