if (document.URL.match( /new/ )) {
  document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('item-form');
    form.addEventListener('click', (e) => {
      e.preventDefault();
      console.log(123);
    });
  });
}