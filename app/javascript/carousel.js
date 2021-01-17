function carousel() {
  const app = Vue.createApp({
    data() {
      return {
        bars: [
          {
            id: 1,
            src: "/assets/bar1.jpg"
          },
          {
            id: 2,
            src: "/assets/bar2.png"
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

  app.mount('#carousel')
}

document.addEventListener('DOMContentLoaded', carousel)