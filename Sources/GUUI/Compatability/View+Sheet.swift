#if !canImport(SwiftUi)

import TokamakShim

public extension View {

    func sheet<Content>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        content: () -> Content
    ) -> some View where Content: View {
        self
    }

    func sheet<Item, Content>(
        item: Binding<Item?>,
        onDismiss: (() -> Void)? = nil,
        content: @escaping (Item) -> Content
    ) -> some View where Item: Identifiable, Content: View {
        self
    }

}

#endif
