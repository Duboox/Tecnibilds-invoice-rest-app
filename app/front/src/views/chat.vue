<style lang="scss" scoped>
    .chat_messages {
        max-height: 400px;
        overflow-y: scroll;
    }
</style>

<template>
    <v-layout column wrap>
        <v-toolbar color="blue" dark>
            <v-toolbar-title>{{ pageTitle }}</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-btn icon>
                <v-icon>more_vert</v-icon>
            </v-btn>
        </v-toolbar>
        <!-- Personal Cards -->
        <v-container>
            <v-card class="elevation-4">
                <v-card-title>
                    <v-flex xs5>
                        <v-text-field
                                append-icon="search"
                                label="Buscar"
                                v-model="search"
                                single-line
                                hide-details
                        ></v-text-field>
                    </v-flex>
                    <v-spacer></v-spacer>
                    <v-badge overlay right color="purple" overlap>
                        <span slot="badge">{{usersInChat.length}}</span>
                        <v-icon
                                large
                                color="grey lighten-1"
                        >
                            account_circle
                        </v-icon>
                    </v-badge>
                </v-card-title>
                <v-list class="chat_messages" three-line v-chat-scroll>
                    <template v-for="item in filteredMessages">
                        <v-list-tile avatar v-bind:key="item.title" @click="">
                            <v-list-tile-avatar>
                                <img v-bind:src="ApiUsersPics + item.user.picture" :alt="item.user.name"/>
                            </v-list-tile-avatar>
                            <v-list-tile-content>
                                <v-list-tile-title>
                                    <v-layout row>
                                                   <span class="subheading">
                                                       {{ item.user.name }}
                                                   </span>
                                        <v-spacer></v-spacer>
                                        <span class="caption grey--text">{{item.created_at}}</span>
                                    </v-layout>
                                </v-list-tile-title>
                                <v-list-tile-sub-title>{{item.message}}</v-list-tile-sub-title>
                            </v-list-tile-content>
                        </v-list-tile>
                        <v-divider></v-divider>
                    </template>
                    <v-layout v-show="messages.model.length === 0" row align-center align-content-center justify-center>
                        <span class="headline">No hay nada aquí Todavía</span>
                    </v-layout>
                </v-list>
                <v-card-actions>
                    <v-text-field
                            label="Escribe tu mensaje..."
                            id="newMessage"
                            name="newMessage"
                            v-model="newMessage.model.message"
                            v-on:keypress.enter="sendMessage()"
                            required
                    ></v-text-field>
                    <v-btn icon>
                        <v-icon>attach_file</v-icon>
                    </v-btn>
                    <v-btn icon>
                        <v-icon color="grey">camera_alt</v-icon>
                    </v-btn>
                    <v-btn color="primary" v-on:click="sendMessage()">
                        Enviar
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-container>
    </v-layout>
</template>

<script>
  import {mapGetters, mapActions} from 'vuex';

  export default {
    data () {
      return {
        pageTitle: 'Chat',
        ApiUsersPics: this.$configs.ApiUrl + 'images/users/',
        search: '',
        messageText: '',
        usersInChat: ''
      }
    },
    computed: {
      ...mapGetters({
        messages: 'getMessages',
        newMessage: 'getNewMessage'
      }),
      filteredMessages: function () {
        return this.messages.model.filter((message) => {
          return message.message.toLowerCase().match(this.search);
        });
      },
    },
    created() {
      let vm = this;
      vm.setMessages();
      vm.$echo.join('chatRoom')
          .here((users) => {
            vm.usersInChat = users;
          })
          .joining((user) => {
            vm.usersInChat.push(user)
          })
          .leaving((user) => {
            vm.usersInChat = vm.usersInChat.filter(u => u != user)
          })
          .listen('ChatMessagePosted', (e) => {
            let CommitMessage = {
              created_at: e.chatMessage.created_at,
              id: e.chatMessage.id,
              message: e.chatMessage.message,
              updated_at: e.chatMessage.updated_at,
              user_id: e.chatMessage.user_id,
              user: e.user
            };
            vm.$store.commit('SAVE_MESSAGE', CommitMessage);
          });
    },
    methods: {
      setMessages() {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('setMessages')
            .then(response => {
              vm.$Progress.finish();
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      sendMessage() {
        let vm = this;
        vm.$Progress.start();
        let data = {
          user_id: vm.$store.state.users.authenticatedUser.id,
          message: vm.newMessage.model.message,
        };
        vm.$store.dispatch('sendMessage', data)
            .then(response => {
              vm.$Progress.finish();
            })
            .catch(error => {
              vm.$Progress.fail();
            })
        vm.messageText = '';
      },
    }
  }
</script>


