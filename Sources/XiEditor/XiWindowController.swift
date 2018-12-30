// Copyright 2018 The xi-editor Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import AppKit.NSWindowController

final class XiWindowController: NSWindowController {
    private var edited = false
    
    override func windowTitle(forDocumentDisplayName displayName: String) -> String {
        let editedIndicator = edited ? "• " : ""
        
        #if DEBUG
        return "\(editedIndicator) [Debug] \(displayName)"
        #else
            return "\(editedTitleStatus)\(displayName)"
        #endif
    }
    
    func updateEditedTitleStatus(_ edited: Bool) {
        self.edited = edited
        self.synchronizeWindowTitleWithDocumentName()
    }
}
