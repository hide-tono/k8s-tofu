# k8s-tofu
k8s environment with tofu

## プロンプト

```
Devcontainerでtofuのfeatureを使用するような設定ファイルを作成してください
```

```
下記のTerraformでKubernetesを使用する方法を参考に、tofuでKubernetesを使用する方法を記述してください。
https://blog.koh-sh.com/posts/practice-terraform-with-local-k8s/
```


### 動作確認

kind起動

```sh
kind create cluster --config=.kube/kind.yaml
```

1. 適当なディレクトリを作成します。

```sh
mkdir opentofu-with-k8s
cd opentofu-with-k8s
```

2. `tofu init`コマンドを実行してKubernetes Providerをインストールします。

```sh
tofu init
```

3. `tofu plan`コマンドを実行してドライランします。

```sh
tofu plan 
```

4. `tofu apply`コマンドを実行して実際に適用します。

```sh
tofu apply
```

5. `kubectl get namespace`コマンドを実行してnamespaceが作成されていることを確認します。

```sh
kubectl get namespace
```

### 名前空間の更新

1. `main.tf`ファイルのnamespaceの名前を`my-second-namespace`に変更します。

```hcl
resource "kubernetes_namespace" "example" {
  metadata {
    name = "my-second-namespace"
  }
}
```

2. `tofu plan`コマンドを実行して変更を確認します。

```sh
tofu plan
```

3. `tofu apply`コマンドを実行して変更を適用します。

```sh
tofu apply
```

4. `kubectl get namespace`コマンドを実行してnamespaceが更新されていることを確認します。

```sh
kubectl get namespace
```

この手順に従うことで、tofuを使用してKubernetesを管理することができます。