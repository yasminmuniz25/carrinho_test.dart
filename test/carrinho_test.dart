import 'package:cart_test/models/carrinho.dart';
import 'package:cart_test/models/item_carrinho.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Deve inicializar com carrinho vazio", () {
    //Arrange
    final carrinho = CarrinhoDeCompras();
    //Assert
    expect(carrinho.itens, isEmpty);
    expect(carrinho.calcularSubtotal(), 0.0);
  });

  test("Deve adicionar itens no carrinho com sucesso", () {
    final carrinho = CarrinhoDeCompras();
    final item = ItemCarrinho(nome: "Caderno", preco: 50);

    carrinho.adicionarItem(item);

    expect(carrinho.itens.length, 1);
    expect(carrinho.itens[0].nome, equals("Caderno"));
    expect(carrinho.calcularSubtotal(), equals(50));
  });

  test("Deve remover item pelo nome", () {
    final carrinho = CarrinhoDeCompras();
    final item = ItemCarrinho(nome: "Caderno", preco: 50);

    final item2 = ItemCarrinho(nome: "Joia", preco: 5000);

    carrinho.adicionarItem(item);
    carrinho.adicionarItem(item2);

    carrinho.removerItem("Caderno");

    expect(carrinho.itens.length, 1);
    expect(carrinho.itens[0].nome, equals("Joia"));
  });

  test("Deve aplicar 10% de desconto", () {
    final carrinho = CarrinhoDeCompras();
    final item = ItemCarrinho(nome: "Caderno", preco: 50);
    carrinho.adicionarItem(item);
    
    expect(carrinho.calcularTotalComDesconto(percentualDesconto: 10.0), equals(45));


  });
}
