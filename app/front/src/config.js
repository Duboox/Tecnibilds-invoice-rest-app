export default function (Vue) {
  const Api = 'http://api.tecnibilds.com.ve' + '/';

  Vue.configs = {
    appName: 'Tecnibilds',
    appCompany: 'Tecnibilds',
    appLogo: '',
    appLocale: 'es',
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
