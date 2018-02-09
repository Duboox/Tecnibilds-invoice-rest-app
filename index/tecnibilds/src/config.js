export default function (Vue) {
    Vue.configs = {
        appName: 'Tecnibilds',
        appCompany: 'Tecnibilds',
        appLogo: '',
    }
    Object.defineProperties(Vue.prototype, {
        $configs: {
            get() {
                return Vue.configs
            }
        }
    })
}
