import { git_assets } from "./declarations/git_assets";
const copyButtonLabel = '<i data-feather="copy"></i>';

window.onload = async () => {
  let repos = await git_assets.list({}).then((res) => {
    const regex = /([A-z0-9_-]*.git)/g;
    let repos = new Set();
    for (const file of res) {
      const match = file.key.match(regex);
      if (match) {
        repos.add(match[0]);
      }
    }
    return repos;
  });

  let host = window.location.origin;
  // replace with raw ic0 if not done already in host
  if (!host.includes(".raw.ic0")) {
    host = host.replace(".ic0", ".raw.ic0");
  }

  document.getElementById("repos").innerHTML = Array.from(repos)
    .map((repo) => `<pre>git clone ${host}/${repo}</pre>`)
    .join("");

  let blocks = document.querySelectorAll("pre");

  blocks.forEach((block) => {
    // only add button if browser supports Clipboard API
    if (navigator.clipboard) {
      let button = document.createElement("i", { "data-feather": "copy" });
      button.innerHTML = copyButtonLabel;
      button.addEventListener("click", copy);
      block.appendChild(button);
    }
  });

  feather.replace();
};

async function copy(event) {
  console.log(event);
  const button = event.srcElement;
  const pre = button.parentElement;
  let text = pre.innerText;
  await navigator.clipboard.writeText(text);

  button.innerHTML = '<i data-feather="check"></i>';
  feather.replace();

  setTimeout(() => {
    button.innerHTML = copyButtonLabel;
    feather.replace();
  }, 3000);
}
