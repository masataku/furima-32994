const pay = () => {
  Payjp.setPublicKey("pk_test_6e72a28837a18e5b3d04c5de");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

  });
};

window.addEventListener("load", pay);