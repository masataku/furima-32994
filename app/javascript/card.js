const pay = () => {
  Payjp.setPublicKey("pk_test_6e72a28837a18e5b3d04c5de");
  const formDom = document.getElementById("charge-form");
  formDom.addEventListener("submit", (e) => {
    e.preventDefault();   
    const formData = new FormData(formDom);
    const card = {
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;  
      }
    });
  });
};

window.addEventListener("load", pay);