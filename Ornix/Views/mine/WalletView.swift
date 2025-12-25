//
//  WalletView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/16.
//

import SwiftUI
import StoreKit
import AlertToast

struct BohemianCoin: Identifiable {
    let id = UUID()
    let complemNum: Int
    let raamberlMeiy : Double
    let braceletKey : String
}

struct WalletView: View {
    @State private var showToast = false
    @State private var toastMessage = ""
    @State private var products: [Product] = []
    @Environment(\.dismiss) var dismiss
    @State private var sticateCoin = 0
    
    let chbohoicCoin: [BohemianCoin] = [
        BohemianCoin(complemNum: 400, raamberlMeiy: 0.99, braceletKey: "olijqkcoepicfpua"),
        BohemianCoin(complemNum: 800, raamberlMeiy: 1.99, braceletKey: "ufxyohiyworlqaed"),
        BohemianCoin(complemNum: 2450, raamberlMeiy: 4.99, braceletKey: "apqilufmkxxbtjzm"),
        BohemianCoin(complemNum: 3950, raamberlMeiy: 7.99, braceletKey: "bwhsyzplkvnquorx"),
        BohemianCoin(complemNum: 4900, raamberlMeiy: 9.99, braceletKey: "qafbqxircsraksjl"),
        BohemianCoin(complemNum: 9800, raamberlMeiy: 19.99, braceletKey: "wjxjoizjinfyrztp"),
        BohemianCoin(complemNum: 17400, raamberlMeiy: 34.99, braceletKey: "cvhqxftmjrlwyuen"),
        BohemianCoin(complemNum: 24500, raamberlMeiy: 49.99, braceletKey: "tdkwgdgmkgvvoyta"),
        BohemianCoin(complemNum: 34500, raamberlMeiy: 69.99, braceletKey: "dxjrzgkvsmpyutin"),
        BohemianCoin(complemNum: 49000, raamberlMeiy: 99.99, braceletKey: "avgryfskizmviumj"),
    ]
    
    
        
        // 定义两列网格
        let columns = [
            GridItem(.flexible(), spacing: 13),
            GridItem(.flexible(), spacing: 13)
        ]
    var body: some View {
        
        ZStack{
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(alignment: .leading,spacing:0){
                Button(action: {
                    dismiss()
                }) {
                    Image("zkugcq_back")
                        .resizable()
                        .frame(width: 15, height: 10)
                        .frame(width: 36, height: 36)
                        .background(
                            Color(red: 0, green: 0, blue: 0, opacity: 0.2)
                                .clipShape(Circle())
                        )
                    
                }
                .padding(.top,55)
                .padding(.bottom,24)
              
                .frame(maxWidth: .infinity,alignment: .leading)
                
                ZStack {
                    LinearGradient(
                        colors: [
                            Color(red: 236/255, green: 55/255, blue: 250/255),
                            Color(red: 152/255, green: 43/255, blue: 251/255),
                            
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(height: 86)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(15)
                    
                    HStack{
                        VStack{
                            Text("\(sticateCoin)")
                                .font(.system(size: 30, weight: .black))
                                .foregroundColor(.white)
                            Text("Balance")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white.opacity(0.5))
                            
                        }
                        Spacer()
                        Image("zucbqu_dajin")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 76, height: 76)
                                      
                    }.padding(
                        .horizontal,16
                    )
                }.padding(.bottom,16)
                
                ScrollView(showsIndicators:false) {
                           LazyVGrid(columns: columns, spacing: 13) {
                               ForEach(chbohoicCoin) { item in
                                   Button {
                                       // 找到对应的 Product
                                                   if let product = products.first(where: { $0.id == item.braceletKey }) {
                                                       Task {
                                                           await purchase(product)
                                                       }
                                                   } else {
                                                    
                                                       showToast = true
                                                       toastMessage = "Product not loaded"
                                                   }
                                          } label: {
                                              Rectangle()
                                                  .fill(Color(red: 48/255, green: 49/255, blue: 51/255))
                                                  .frame(height: 108)
                                                  .overlay(
                                                      VStack{
                                                          Image("zucbqu_dajin")
                                                              .resizable()
                                                              .aspectRatio(contentMode: .fill)
                                                              .frame(width: 40, height: 40)
                                                              .padding(.top,5)

                                                          Text("\(item.complemNum)")
                                                              .font(.system(size: 16, weight: .black))
                                                              .foregroundColor(Color(red: 237/255, green: 55/255, blue: 251/255))

                                                          ZStack{
                                                              Color(red: 89/255, green: 90/255, blue: 92/255)
                                                                  .frame(height: 38)
                                                                  .frame(maxWidth: .infinity)
                                                              Text("$ \(String(format: "%.2f", item.raamberlMeiy))")
                                                                  .font(.system(size: 12, weight: .semibold))
                                                                  .foregroundColor(.white)
                                                          }
                                                      }
                                                  )
                                                  .cornerRadius(15)
                                          }
                               }
                           }
                           
                }.padding(.bottom,35)
                
                
                
                Spacer()
            }.padding(.horizontal,16)
            GlobalLoadingView()
        }.toast(isPresenting: $showToast) {
            AlertToast(type: .regular, title: toastMessage)
        }
        
        .task {
            let manager = AppStorageManager.shared;
            sticateCoin = manager.getUsers().first{$0.refinedUid==manager.getCurrentUserId()}?.accentingCoin ?? 0
            
            
            
            
            GlobalLoadingManager.shared.show()
            await loadProducts()
            GlobalLoadingManager.shared.hide()
            
            Task {
                    for await verificationResult in Transaction.updates {
                        await handleTransaction(verificationResult)
                    }
                }
        }
    }
    
    // 获取商品
    func loadProducts() async {
        do {
            // 用所有 BohemianCoin 的 braceletKey 数组去获取商品
            let productIDs = chbohoicCoin.map { $0.braceletKey }
            products = try await Product.products(for: productIDs)
        } catch {
          
            showToast = true
            toastMessage = "Failed to fetch products: \(error)"
        }
    }

       
       // 购买商品
       func purchase(_ product: Product) async {
           GlobalLoadingManager.shared.show()
           do {
               let result = try await product.purchase()
               switch result {
               case .success(let verification):
                   switch verification {
                   case .verified(let transaction):
                      
                       
                       await transaction.finish()
                       GlobalLoadingManager.shared.hide()
                       let manager = AppStorageManager.shared
                      
                       if let purchasedCoin = chbohoicCoin.first(where: { $0.braceletKey == transaction.productID }) {
                                          
                                               manager.updateUser(uid: manager.getCurrentUserId()) { user in
                                                   var modified = user
                                                   modified.accentingCoin += purchasedCoin.complemNum
                                                   sticateCoin = modified.accentingCoin
                                                   return modified
                                               }
                                           
                                       }
                                      
                       
                       
                       showToast = true
                       toastMessage = "Purchase successful"
                      
                       
                       
                   case .unverified(_, _):
                      
                       showToast = true
                       toastMessage = "Purchase unverified"
                   }
               case .userCancelled:
                  
                   showToast = true
                   toastMessage = "Cancelled"
                   GlobalLoadingManager.shared.hide()
               case .pending:
                  
                   showToast = true
                   toastMessage = "Purchase pending"
               @unknown default:
                   break
               }
           } catch {
             
               showToast = true
               toastMessage = "Purchase failed: \(error)"
               GlobalLoadingManager.shared.hide()
           }
       }
    
    func handleTransaction(_ verificationResult: VerificationResult<StoreKit.Transaction>) async {
        switch verificationResult {
        case .verified(let transaction):
            
            showToast = true
            toastMessage = "Purchase successful"
            await transaction.finish()
        case .unverified(_, _):
           
            showToast = true
            toastMessage = "Purchase unverified"
        }
    }
}

#Preview {
    WalletView()
}
