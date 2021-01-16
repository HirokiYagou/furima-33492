function search() {
  Vue.createApp({
    data() {
      return {
        items: [],
        // itemLink: '',
      }
    },
    methods: {
      fetchItem: function() {
        fetch('/search.json')
          .then(response => {
            return response.json()
          })
          .then(data => {
             this.items = data
          })
          .catch(error => {
            console.log(error)
          })
      },
      // fetchLink: function{
      //   this.itemLink = `/item/${}`
      // }
    },
    mounted() {
      this.fetchItem()
    },
  }).mount('#search')
}

document.addEventListener('DOMContentLoaded', search)