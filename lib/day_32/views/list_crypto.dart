import 'package:belajar_ppkd/day_32/models/crypto_model.dart';
import 'package:belajar_ppkd/day_32/service/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListCryptoScren extends StatefulWidget {
  const ListCryptoScren({super.key});

  @override
  State<ListCryptoScren> createState() => _ListCryptoScrenState();
}

class _ListCryptoScrenState extends State<ListCryptoScren> {
  final NumberFormat _formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  List<CryptoModel> _cryptoList = [];
  List<CryptoModel> _filteredList = [];
  bool _isLoading = true;
  String _errorMessage = '';
  final TextEditingController _searchController = TextEditingController();

  // ✅ Fungsi untuk memotong teks (harga & persen)
  String trimText(String text, [int limit = 10]) {
    return text.length > limit ? '${text.substring(0, limit)}...' : text;
  }

  String trimTextPercent(String text, [int limit = 5]) {
    return text.length > limit ? text.substring(0, limit) : text;
  }

  Future<void> _loadCrypto() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final data = await fetchCrypto();
      setState(() {
        _cryptoList = data;
        _filteredList = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  // ✅ Fungsi untuk filter/search data
  void _searchCrypto(String query) {
    final filtered = _cryptoList.where((crypto) {
      final name = crypto.name?.toLowerCase() ?? '';
      final symbol = crypto.symbol?.toLowerCase() ?? '';
      final searchQuery = query.toLowerCase();
      return name.contains(searchQuery) || symbol.contains(searchQuery);
    }).toList();

    setState(() {
      _filteredList = filtered;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCrypto();
    _searchController.addListener(() {
      _searchCrypto(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text("💰"),
                const SizedBox(width: 10),
                const Text("Cryptocurrency Market"),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              "Real-time cryptocurrency prices and market data",
              style: TextStyle(fontSize: 12, color: Color(0xff717182)),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              controller: _searchController,
              placeholder: "Search by name or symbol...",
            ),
            const SizedBox(height: 12),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_errorMessage.isNotEmpty)
              Text(_errorMessage)
            else
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _loadCrypto,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Showing ${_filteredList.length} cryptocurrencies"),
                      const SizedBox(height: 12),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _filteredList.length,
                          itemBuilder: (context, index) {
                            final data = _filteredList[index];
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            '${data.image}',
                                          ),
                                          backgroundColor: Colors.transparent,
                                        ),
                                        const SizedBox(width: 16),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  trimText(data.name ?? ''),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(width: 8),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 2,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                    border: Border.all(
                                                      color: const Color(
                                                        0xffe5e5e5,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    '${data.symbol?.toUpperCase()}',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Rank #${data.marketCapRank}',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff717182),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              trimText(
                                                _formatter.format(
                                                  data.currentPrice,
                                                ),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              trimTextPercent(
                                                data.priceChangePercentage24H
                                                    .toString(),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    const Divider(color: Color(0xffe5e5e5)),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Market Cap"),
                                            Text(
                                              trimText(
                                                _formatter.format(
                                                  data.marketCap,
                                                ),
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Volume (24h)"),
                                            Text(
                                              trimText(
                                                _formatter.format(
                                                  data.totalVolume,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
