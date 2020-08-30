# Flutter MVVM ToDo App Sample

A new Flutter Task management application using Change Notifier and Provider.

## about

- タスクとグループが存在する
- タスクはグループに所属する

- タスクは複数のグループに所属することができる


## architecture

- domains層
  - usecase
    - アプリケーションのロジック. ここでdomain modelを協調させる
      - TODO: readとwriteを分ける
        - Maybe: readはusecaseではなくqueryに分けたほうがいいかもしれない
  - protocol
    - usecaseとviewModelでやり取りするためのprotocolを定義する
      - 例: タスクを新規作成する場合
        - createTaskRequest
        - createTaskResponse
          - createTaskResponse.success
          - createTaskResponse.failure
      - ドメイン層でのエラーはcreateTaskResponse.failureに変換してviewModelに渡す
  - repository
    - データの永続化
      - TODO: 受け渡しの型をFutureにラップする
        - ※ 非同期処理の説明もすると長くなるので一時的にFutureでラップせずに扱っている
  - model
    - ドメインモデル
  - values
    - バリューオブジェクト
- view
  - viewModel
    - viewの状態管理を行う
    - usecaseのインターフェースを介してドメイン層への入力を行ったりドメイン層からの出力を受け取ったりする
      - その際に、入力をusecaseで扱うために変換したり、usecaseから受け取った値をviewで扱うために変換する
  - view
    - 画面の表示・レイアウト
