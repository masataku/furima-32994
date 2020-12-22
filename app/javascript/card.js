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
        const tokenTag = `<input name="token" value=${token} type="hidden" >`;
        formDom.insertAdjacentHTML("beforeend", tokenTag); 
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name"); 
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        
        formDom.submit();
      }
    });
  });
};

window.addEventListener("load", pay);