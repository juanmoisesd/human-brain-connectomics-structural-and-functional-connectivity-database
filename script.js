// Scientific Repository Script
// Metadata and citation helper
document.addEventListener('DOMContentLoaded', function() {
  // Add copy-to-clipboard for citation
  const codeEl = document.querySelector('code');
  if (codeEl) {
    codeEl.style.cursor = 'pointer';
    codeEl.title = 'Click to copy citation';
    codeEl.addEventListener('click', function() {
      navigator.clipboard.writeText(codeEl.textContent).then(() => {
        const orig = codeEl.textContent;
        codeEl.textContent = '✅ Copied to clipboard!';
        setTimeout(() => { codeEl.textContent = orig; }, 2000);
      });
    });
  }
  
  // Track page view (privacy-friendly, no external calls)
  console.log('Dataset page loaded: Repository of databases on human brain connectomics: structural connectivity (DTI, tractography) and functional connectivity (fMRI), including brain network maps and interindividual variability. Data compiled and organized for neuroscience research. ');
  console.log('Author: Juan Moisés de la Serna Tuya | ORCID: https://orcid.org/0000-0002-8401-8018');
});
