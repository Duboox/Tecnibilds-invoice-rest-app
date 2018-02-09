import axios from 'axios';
import config from '../config'

export default {
  state: {
    messages: {
      model: []
    },
    newMessage: {
      model: {
        message: ''
      }
    },
  },

  mutations: {
    SET_MESSAGES(state, messages){
      state.messages = messages
    },
    SAVE_MESSAGE(state, message){
      state.messages.model.push(message);
      state.newMessage.model.message = ''
    },
  },

  actions: {
    setMessages({commit, getters}) {
      return new Promise((resolve, reject) => {
        axios[config.getMessagesMethod](config.apiUrl + config.getMessagesRequest, {headers: getters.getHeader})
            .then(response => {
              let messages = response.data;
              commit('SET_MESSAGES', messages);
              resolve(response)
            })
            .catch(error => {
              reject(error)
            })
      })
    },
    saveMessage({commit, getters, state, rootState}, data) {
      return new Promise((resolve, reject) => {
        axios[config.saveMessagesMethod](config.apiUrl + config.saveMessagesRequest, data, {headers: getters.getHeader})
            .then(response => {
              let res = response.data;
              if (res.saved = true) {
                let commitMessage = {
                  user_id:  rootState.users.authenticatedUser.id,
                  message: state.newMessage.model.message,
                  user: {
                    name: rootState.users.authenticatedUser.name,
                    picture: rootState.users.authenticatedUser.picture,
                  },
                };
                commit('SAVE_MESSAGE', commitMessage);
              }
            })
            .catch(error => {
              reject(error);
            })
      })
    },
  },

  getters: {
    getMessages(state) {
      return state.messages
    },
    getNewMessage(state) {
      return state.newMessage
    },
  },
}