# Microsoft Teams Setup Guide: Epic Slide Studio (Supabase Cloud Hosted)

This guide contains the step-by-step instructions to upload, configure, and automatically distribute the **Epic Slide Studio** app to your team leaders natively in Microsoft Teams using secure cloud hosting.

---

## Phase 1: Deploying the Files (Done! ✅)
* We have successfully deployed your presentation page (`index.html`) using **GitHub Pages** to host and serve it natively inside Microsoft Teams:
  `https://oubellahassan.github.io/epic-slide-studio/`
* This solves all raw code rendering, file downloading, and iframe security issues! No manual uploads are needed. Any code change pushed to your GitHub repo will update inside Teams instantly.

---

## Phase 2: Updating the App in Microsoft Teams

1. Locate the updated **`epic-slide-studio.zip`** package inside your **`EpicHR`** folder on your Desktop.
2. Open the [Microsoft Teams Admin Center](https://admin.teams.microsoft.com/).
3. In the left menu, expand **Teams apps** and click **Manage apps**.
4. Search for **`Epic Slide Studio`** in the list and click directly on its name.
5. In the top action bar of the details page, click the **`Upload file`** (or **`Update`**) button.
6. Select the updated **`epic-slide-studio.zip`** file (version `1.0.4`) and upload it.

---

## Phase 3: Refreshing the App on your Sidebar

Because Teams caches manifests heavily:
1. In Microsoft Teams, right-click the **Epic Slide Studio** icon on your left sidebar and select **Uninstall** (or **Remove**).
2. Click the **`...` (More apps)** icon on your Teams sidebar.
3. Search for `Epic Slide Studio`, click on it, and click **Add** (then right-click -> **Pin**).
4. **The app will now load natively and instantly without any more SharePoint prompts!**

---

## Phase 4: Pushing the App to Leaders Automatically (For IT Admins)

To force-install and pin the app to all leaders' sidebars so they don't have to add it themselves:
1. In the Teams Admin Center, go to **Teams apps** -> **Setup policies**.
2. Select your existing custom policy (e.g. *Epic Leaders Policy* or *Global*).
3. Under **Installed apps**, ensure `Epic Slide Studio` is added.
4. Under **Pinned apps**, ensure `Epic Slide Studio` is added and moved to the top.
5. Click **Save**.
