function carousel() {
  const app = Vue.createApp({
    data() {
      return {
        message: 'たまプラーザ'
      }
    },
  })

  app.mount('#carousel')
}

document.addEventListener('DOMContentLoaded', carousel)