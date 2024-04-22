const price = () => {
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value);
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    const taxAmount = Math.floor(inputValue * 0.1); // 販売手数料を整数に丸める
    const profitAmount = inputValue - taxAmount; // 販売利益を計算

    addTaxDom.innerHTML = taxAmount;
    profitDom.innerHTML = profitAmount;
  });
}

document.addEventListener("turbo:render", () => {
  price();
});