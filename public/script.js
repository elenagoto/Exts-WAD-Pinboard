const search = document.querySelector(" .search__field");

search.addEventListener('focus', (e) => {
  search.parentElement.classList.add('focus');
})
search.addEventListener('blur', (e) => {
  search.parentElement.classList.remove('focus');
})
