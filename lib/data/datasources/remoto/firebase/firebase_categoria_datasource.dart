import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_eventos/data/datasources/i_categoria_datasource.dart';
import 'package:gestao_eventos/data/models/categoria_model.dart';

class FirebaseCategoriaDataSource implements ICategoriaDataSource {
  FirebaseCategoriaDataSource({
    required FirebaseFirestore firestore,
    required ICategoriaDataSource categoriaDataSource,
  })  : _firestore = firestore,
        _categoriaDataSource = categoriaDataSource;

  final FirebaseFirestore _firestore;
  final ICategoriaDataSource _categoriaDataSource;
  final String _collectionName = 'categorias';

  @override
  Future<bool> createCategoria(CategoriaModel categoria) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(categoria.id)
          .set(categoria.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteCategoria(CategoriaModel categoria) {
    // TODO: implement deleteCategoria
    throw UnimplementedError();
  }

  @override
  Future<CategoriaModel?> getCategoria(String id) async {
    try {
      final result = await _firestore
          .collection(_collectionName)
          .doc(id)
          .get()
          .then((doc) async {
        final categoria = await _categoriaDataSource.getCategoria(
          doc.data()!['categoriaId'] as String,
        );

        doc.data()!['categoria'] = categoria;

        return CategoriaModel.fromMap(doc.data()!);
      });

      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<CategoriaModel>> getCategorias() {
    // TODO: implement getCategorias
    throw UnimplementedError();
  }

  @override
  Future<CategoriaModel> updateCategoria(CategoriaModel categoria) {
    // TODO: implement updateCategoria
    throw UnimplementedError();
  }
}
