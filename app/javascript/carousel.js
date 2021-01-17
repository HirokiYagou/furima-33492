function carousel() {
  const app = Vue.createApp({
    data() {
      return {
        message: 'たまプラーザ',
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
      }
    },
    methods: {
      onClickPager: function(index) {
        this.imageTransitionName = this.selectedIndex < index ? "next" : "prev"
        this.selectedIndex = index
      },
      nextPager: function() {
        this.imageTransitionName = "next"
        this.selectedIndex =
          this.selectedIndex >= this.lastIndex ? 0 : this.selectedIndex + 1
      },
    },
  })

  app.mount('#carousel')
}

document.addEventListener('DOMContentLoaded', carousel)