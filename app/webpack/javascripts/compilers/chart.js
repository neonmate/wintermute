// https://makandracards.com/makandra/71439-webpack-how-to-split-your-bundles

import 'chart.js/dist/Chart.css'

up.compiler('canvas[chart]', (element, configuration) => {
  let chart = undefined

  loadChartJS()
  .then(chartJS => {
    let ctx = element.getContext('2d')
    console.log(configuration)
    chart = new chartJS(ctx, configuration)
  })

  function loadChartJS() {
    return Promise.all([
      import(/* webpackChunkName: "chart.js" */ 'chart.js/dist/Chart.js')
    ]).then((imports) => {
      return imports[0].default
    })
  }

  return () => {
    if (chart) {
      chart.destroy()
    }
  }
})
