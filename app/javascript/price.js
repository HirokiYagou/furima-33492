window.addEventListener("keyup", () => {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  addTaxPrice.textContent = Math.floor(itemPrice.value * 0.1);
  profit.textContent = itemPrice.value - Math.floor(itemPrice.value * 0.1);
});