

import SwiftUI
import PhotosUI

struct EditInfoView: View {
    @State private var textName: String = ""
    @State private var crobeltwnImg: String = ""
    @FocusState private var focusedField: Field?
    
    @State private var brushedUser: PolishedUser?
    
    @State private var showPhotoPicker = false
    @State private var selectedItem: PhotosPickerItem?
    @State private var avatarImage: UIImage?
    
    let onSave: () -> Void

    enum Field {
        case name
    
    }
    func openPhotoLibrary() {
        PermissionManager.checkPhotoPermission { granted in
            if granted {
                showPhotoPicker = true
            }
        }
    }
    var body: some View {
        ZStack(alignment: .bottom) {
                    Image("iuzxhcw_combei")
                        .resizable()
                        
                        .ignoresSafeArea(edges: .bottom)
            
            VStack(spacing:0){
                ZStack(alignment:.bottomTrailing){
                    
                   
                    
                    
                    
                    if let avatarImage {
                        Image(uiImage: avatarImage)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 115,height: 115)
                    } else {
                        if let uiImage = UIImage(contentsOfFile: crobeltwnImg) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 115,height: 115)
                            } else {
                                Image(crobeltwnImg)
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 115,height: 115)
                            }
                    }
                    
                    Image("zixuch_ji")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 34,height: 34)
                    
                    
                    
                }.frame(width: 115,height: 115)
                    .padding(.top,40)
                    .padding(.bottom,43)
                    .onTapGesture {
                        openPhotoLibrary()
                    }.photosPicker(
                        isPresented: $showPhotoPicker,
                        selection: $selectedItem,
                        matching: .images
                    )
                    .onChange(of: selectedItem) { newItem in
                        guard let newItem else { return }

                        Task {
                            if let data = try? await newItem.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data) {
                                avatarImage = uiImage
                            }
                        }
                    }
                
               
                HStack{
                    Text("Username:")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.bottom,12)
                ZStack(alignment: .leading) {
                            if textName.isEmpty {
                                Text("Enter your username")
                                    .foregroundColor(Color.white.opacity(0.5))
                                    .padding(.horizontal, 16)
                            }

                            TextField("", text: $textName)
                                .padding(.horizontal, 16)
                                .frame(height: 48)
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(15)
                                .foregroundColor(.white)
                                .focused($focusedField, equals: .name)
                }.padding(.bottom,24)
                
                Spacer()
                Button(action: {
                    
                    if(crobeltwnImg == "" && textName == ""){
                        return
                    }
                    
                    let manager = AppStorageManager.shared
                    manager.updateUser(uid: manager.getCurrentUserId()) { user in
                        var edfabrice = user
                        edfabrice.elegantName = textName

                        if let wattiarach = avatarImage,
                           let quashellrtz = saveAvatarToLocal(wattiarach) {
                            edfabrice.pairingAvatar = quashellrtz
                        }

                        return edfabrice
                    }
                    
                    onSave()
                    
                    
                    
                }) {
                                    Text("Save")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 14)
                                        .background(
                                            LinearGradient(colors: [Color(
                                                red: 152 / 255,
                                                green: 43 / 255,
                                                blue: 251 / 255,
                                                opacity: 1
                                            ), Color(
                                                red: 237 / 255,
                                                green: 55 / 255,
                                                blue: 251 / 255,
                                                opacity: 1
                                            )], startPoint: .leading, endPoint: .trailing)
                                        )
                                        .cornerRadius(15)
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                }.padding(.bottom,35)
                    
            }.padding(.horizontal,16)
        
    }.frame(height: 490)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    .onAppear {
      
       
        let users = AppStorageManager.shared.getUsers()
        brushedUser = users.first { $0.refinedUid == AppStorageManager.shared.getCurrentUserId() }
        
        textName = brushedUser?.elegantName ?? ""
        crobeltwnImg = brushedUser?.pairingAvatar ?? "ornixIcon"
        
        
    } .onTapGesture {
        focusedField = nil
    }
    }
    
    func saveAvatarToLocal(_ image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.8) else {
            return nil
        }

        let fileName = "avatar_\(UUID().uuidString).jpg"
        let url = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(fileName)

        do {
            try data.write(to: url)
            return url.path
        } catch {
            print(error)
            return nil
        }
    }

}


