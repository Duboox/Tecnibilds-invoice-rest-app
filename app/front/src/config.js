export default function (Vue) {
  const Api = 'http://127.0.0.1:8000/'

  Vue.configs = {
    appName: 'Tecnibilds',
    appCompany: 'Tecnibilds',
    appLogo: '',
    ApiUrl: Api,
  }
  Object.defineProperties(Vue.prototype, {
    $configs: {
      get() {
        return Vue.configs
      }
    }
  })
}
