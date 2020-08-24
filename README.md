# Flutter MVVM ToDo App Sample

A new Flutter Task management application using Change Notifier and Provider.

## architecture

- domains層
  - usecase
    - アプリケーションのロジック
  - repository
    - データの永続化
  - model
    - ドメインモデル
  - values
    - バリューオブジェクト
- view
  - viewModel
    - viewの状態管理を行う
    - usecaseのインターフェースを介してドメイン層への入力を行ったりドメイン層からの出力を受け取ったりする
  - view
    - 画面の表示・レイアウト
