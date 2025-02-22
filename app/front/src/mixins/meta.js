const meta = require('../router/meta.json')

export default {
  watch: {
    '$route' () {
      this.setMeta()
    }
  },

  created () {
    this.setMeta()
  },

  mounted () {
    this.setMeta()
  },

  methods: {
    setMeta () {
      if (typeof document === 'undefined') {
      }
      let metaData = meta[this.$route.path] || {}
      document.title = metaData.title
      document.querySelector('meta[name="description"]').setAttribute('content', metaData.description)
      document.querySelector('meta[name="keywords"]').setAttribute('content', metaData.keywords)
    }
  }
}
