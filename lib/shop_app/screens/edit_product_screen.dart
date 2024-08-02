import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../utils/xprint.dart';
import '../provider/product.dart';
import '../provider/products.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  static const routeName = '/edit-product';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNote = FocusNode();
  final _descriptionFocusNote = FocusNode();
  final _imageUrlFocusNote = FocusNode();
  final _imageUrlController = TextEditingController();

  final _form = GlobalKey<FormState>();
  var _isInit = true;
  var _isLoading = false;

  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageURL': '',
  };

  var _editedProduct = Product(
    id: null,
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
  );

  void _updateImageUrl() {
    if (!_imageUrlFocusNote.hasFocus) {
      var urlText = _imageUrlController.text;
      if (urlText.isEmpty ||
          (!urlText.startsWith('http') && !urlText.startsWith('https')) ||
          (!urlText.endsWith('.png') &&
              !urlText.endsWith('.jpg') &&
              !urlText.endsWith('.webp') &&
              !urlText.endsWith('.jpeg') &&
              !urlText.endsWith('.gif'))) {
        return;
      }
    }
    setState(() {});
  }

  void setStateLoading(value) => setState(() => _isLoading = value);

  Future<void> _saveForm(ctx) async {
    final isValid = _form.currentState?.validate();

    if (!isValid!) {
      return;
    }

    _form.currentState?.save();

    // xPrint(_editedProduct.title);
    // xPrint(_editedProduct.description);
    // xPrint(_editedProduct.price);
    // xPrint(_editedProduct.imageUrl);

    setStateLoading(true);

// Editing, Update existing product
    if (_editedProduct.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct);
      setStateLoading(false);
      Navigator.of(context).pop();
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct);
      } catch (error) {
        xPrint('_saveForm() $error');
        await showDialog(
            context: ctx,
            builder: (ctx) => AlertDialog(
                  title: const Text('An error occurred!'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Message:'),
                      const Gap(5),
                      Text(
                        '$error',
                        style: const TextStyle(color: Colors.redAccent),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text('Close'))
                  ],
                ));
      } finally {
        setStateLoading(false);
        Navigator.of(ctx).pop();
      }
    }
  }

  Future<void> _saveForm1() async {
    final isValid = _form.currentState?.validate();

    if (!isValid!) {
      return;
    }

    _form.currentState?.save();

    xPrint(_editedProduct.title);
    xPrint(_editedProduct.description);
    xPrint(_editedProduct.price);
    xPrint(_editedProduct.imageUrl);

    setStateLoading(true);

// Editing, Update existing product
    if (_editedProduct.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct);
      setStateLoading(false);
      Navigator.of(context).pop();
    } else {
      await Provider.of<Products>(context, listen: false)
          .addProduct(_editedProduct)
          .catchError((error) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: const Text('An error occurred!'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Message:'),
                      const Gap(5),
                      Text(
                        '$error',
                        style: const TextStyle(color: Colors.redAccent),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close'))
                  ],
                ));
      }).then((v) {
        setStateLoading(false);
        Navigator.of(context).pop();
      });
    }
  }

  @override
  void initState() {
    xPrint('initState');
    _imageUrlFocusNote.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    xPrint('didChangeDependencies');
// _isInit
    if (_isInit) {
      final product = ModalRoute.of(context)?.settings.arguments as Product?;

// if have product init that value
      if (product != null) {
        _editedProduct = Provider.of<Products>(
          context,
          listen: false,
        ).findByProduct(product);

        _initValues = {
          'title': _editedProduct.title ?? '',
          'description': _editedProduct.description ?? '',
          'price': _editedProduct.price.toString(),
          'imageUrl': '',
        };

        _imageUrlController.text = _editedProduct.imageUrl!;
      }
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _priceFocusNote.dispose();
    _descriptionFocusNote.dispose();

    _imageUrlFocusNote.removeListener(_updateImageUrl);
    _imageUrlFocusNote.dispose();
    _imageUrlController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [
          IconButton(
              onPressed: () => _saveForm(context),
              icon: const Icon(Icons.save)),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _form,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _initValues['title'],
                      decoration: const InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNote);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a value';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: _editedProduct.id,
                            title: value ?? '',
                            description: _editedProduct.description,
                            price: _editedProduct.price,
                            imageUrl: _editedProduct.imageUrl,
                            isFavorite: _editedProduct.isFavorite);
                      },
                    ),
                    TextFormField(
                        initialValue: _initValues['price'],
                        decoration: const InputDecoration(labelText: 'Price'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        focusNode: _priceFocusNote,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_descriptionFocusNote);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a value';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter valid number';
                          }
                          if (double.parse(value) <= 0) {
                            return 'Please enter greater than 0';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              id: _editedProduct.id,
                              title: _editedProduct.title,
                              description: _editedProduct.description,
                              price: num.parse(value!),
                              imageUrl: _editedProduct.imageUrl,
                              isFavorite: _editedProduct.isFavorite);
                        }),
                    TextFormField(
                        initialValue: _initValues['description'],
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        focusNode: _descriptionFocusNote,
                        onFieldSubmitted: (_) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a description.';
                          }
                          if (value.length < 10) {
                            return 'should be at least 10 characters long.';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              id: _editedProduct.id,
                              title: _editedProduct.title,
                              description: value,
                              price: _editedProduct.price,
                              imageUrl: _editedProduct.imageUrl,
                              isFavorite: _editedProduct.isFavorite);
                        }),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(top: 8, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: _imageUrlController.text.isEmpty
                              ? const Text('Enter a URL')
                              : FittedBox(
                                  child: CachedNetworkImage(
                                    imageUrl: _imageUrlController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            focusNode: _imageUrlFocusNote,
                            controller: _imageUrlController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an image URL';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL';
                              }

                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg') &&
                                  !value.endsWith('.webp') &&
                                  !value.endsWith('.gif')) {
                                return 'Please enter a valid image URL';
                              }
                              return null;
                            },
                            onSaved: (url) {
                              _editedProduct = Product(
                                  id: _editedProduct.id,
                                  title: _editedProduct.title,
                                  description: _editedProduct.description,
                                  price: _editedProduct.price,
                                  imageUrl: url,
                                  isFavorite: _editedProduct.isFavorite);
                            },
                            onFieldSubmitted: (_) {
                              _saveForm(context);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
