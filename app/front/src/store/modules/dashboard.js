import axios from 'axios';
import config from '../config'

export default {
  state: {
    dashboard: {
      analytics: [],
      posts: {
        newPosts: []
      }
    },
  },

  mutations: {
    SET_DASHBOARD(state, analytics){
      state.dashboard = analytics
    },
    SET_NEW_COMMENT(state, comment){
      state.dashboard.posts.newPosts.filter(function(post){
        if(post.id === comment.post_id){
          post.post_comments.push(comment)
        }
      });
    },
  },

  actions: {
    setDashboard({commit, getters}) {
      return new Promise((resolve, reject) => {
        axios[config.getDashboardMethod](config.apiUrl + config.getDashboardRequest, {headers: getters.getHeader})
            .then(response => {
              let dashboardData = response.data;
              commit('SET_DASHBOARD', dashboardData);
              resolve(response)
            })
            .catch(error => {
              reject(error)
            })
      })
    },
    sendPostComment({commit, getters}, comment) {
      return new Promise((resolve, reject) => {
        axios[config.savePostCommentMethod](config.apiUrl + config.postCommentsRequest, comment, {headers: getters.getHeader})
            .then(function (response) {
              if (response.data.saved) {
                commit('SET_NEW_COMMENT', comment);
                resolve(response);
              }
            })
            .catch(error => {
              reject(error);
            })
      })
    },
    sendNewPost({commit, getters}, post) {
      return new Promise((resolve, reject) => {
        axios[config.savePostMethod](config.apiUrl + config.savePostRequest, post, {headers: getters.getHeader})
            .then(function (response) {
              if (response.data.saved) {
                resolve(response);
              }
            })
            .catch(error => {
              reject(error);
            })
      })
    },
  },

  getters: {
    getAnalytics(state) {
      return state.dashboard.analytics
    },
    getPosts(state) {
      return state.dashboard.posts
    },
  },
}