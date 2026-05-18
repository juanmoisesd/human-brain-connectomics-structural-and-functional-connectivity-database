/**
 * script.js — Frontend logic for Brain Connectomics Database
 */

document.addEventListener('DOMContentLoaded', () => {
    initCitationCopy();
    logMetadata();
});

/**
 * Initializes the copy-to-clipboard functionality for citation blocks.
 */
function initCitationCopy() {
    const citationBlocks = document.querySelectorAll('.citation-block pre, code.citation');

    citationBlocks.forEach(block => {
        block.style.cursor = 'pointer';
        block.title = 'Click to copy citation';

        block.addEventListener('click', async () => {
            try {
                const text = block.textContent;
                await navigator.clipboard.writeText(text);
                showCopyFeedback(block);
            } catch (err) {
                console.error('Failed to copy text: ', err);
                alert('Failed to copy to clipboard. Please select and copy manually.');
            }
        });
    });
}

/**
 * Provides visual feedback after a successful copy.
 * @param {HTMLElement} element - The element that was clicked.
 */
function showCopyFeedback(element) {
    const originalText = element.textContent;
    const feedbackText = '✅ Copied to clipboard!';

    // Check if we are already showing feedback
    if (originalText === feedbackText) return;

    element.textContent = feedbackText;
    element.classList.add('copied');

    setTimeout(() => {
        element.textContent = originalText;
        element.classList.remove('copied');
    }, 2000);
}

/**
 * Logs repository metadata to the console.
 */
function logMetadata() {
    const meta = {
        title: "Human Brain Connectomics Database",
        author: "Juan Moisés de la Serna Tuya",
        orcid: "0000-0002-8401-8018",
        license: "CC BY 4.0 / CC0 1.0",
        version: "1.0.0"
    };

    console.log("%c🧠 Brain Connectomics Repository Loaded", "color: #0366d6; font-weight: bold; font-size: 1.2rem;");
    console.table(meta);
}
