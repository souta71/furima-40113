const price = () => {
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value);
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    const taxAmount = Math.floor(inputValue * 0.1);
    const profitAmount = inputValue - taxAmount;

    addTaxDom.innerHTML = taxAmount;
    profitDom.innerHTML = profitAmount;
  });
}

document.addEventListener("DOMContentLoaded", () => {
  price();
});

document.addEventListener("turbo:render", () => {
  price();
});