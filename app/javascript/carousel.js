function carousel() {
  const app = Vue.createApp({
    data() {
      return {
        bars: [
          {
            id: 1,
            src: "/assets/bar1-7c14f9a586c02e989083416d5d1210a9972c40dcc6c6b6dd3b4e0ecaad9a6b9b.jpg"
          },
          {
            id: 2,
            src: "/assets/bar2-1e7ff02ad79e0de10f96cb7476c58777ddd3699b0cad837525f430ce8e984ac6.png"
          }
        ],
        selectedIndex: 1,
        imageTransitionName: "prev",
      }
    },
    computed: {
      target: function() {
        const self = this
        return this.bars[self.selectedIndex]
      },
      lastIndex: function() {
        return this.bars.length - 1
      },
    },
    methods: {
      onClickPager: function(index) {
        this.imageTransitionName = this.selectedIndex < index ? "next" : "prev"
        this.selectedIndex = index
      },
    },
    mounted() {
      const self = this
      setInterval(function() {
        self.imageTransitionName = "next"
        self.selectedIndex =
          self.selectedIndex >= self.lastIndex ? 0 : self.selectedIndex + 1
      }, 5000)
    },
  })

  if (document.getElementById('carousel')){
    app.mount('#carousel')
  }
}

document.addEventListener('DOMContentLoaded', carousel)
