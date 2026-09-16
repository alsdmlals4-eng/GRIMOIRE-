import json
from pathlib import Path
import tempfile
import unittest

from reportlab.pdfgen.canvas import Canvas
from pypdf import PdfReader
from tools import build_ai_work_evidence as evidence


class CumulativeEvidenceTests(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.TemporaryDirectory()
        self.addCleanup(self.folder.cleanup)
        self.pdf = Path(self.folder.name) / 'monthly.pdf'
        canvas = Canvas(str(self.pdf))
        canvas.drawString(50, 700, 'Existing source-bound evidence remains unchanged.')
        canvas.save()
        self.source = self.pdf.with_suffix('.sources.json')
        self.source.write_text(json.dumps({'month': '2026-09', 'prompts': {'old': ['retain']}}))
        self.receipt = self.pdf.with_suffix('.publication.json')
        self.receipt.write_text(json.dumps({'pdf_sha256': evidence.digest(self.pdf),
            'source_sha256': evidence.digest(self.source), 'pages': 1}))

    def append(self, day='2026-09-16'):
        self.assertTrue(callable(getattr(evidence, 'append_daily', None)), 'Cumulative append missing')
        return evidence.append_daily(self.pdf, [(day, '날짜별 작업 요약', '검증 범위와 미확인 구분')])

    def test_preserves_previous_pages_sources_and_receipt(self):
        old_hash = evidence.digest(self.pdf)
        old_text = PdfReader(self.pdf).pages[0].extract_text()
        self.append()
        self.assertEqual(PdfReader(self.pdf).pages[0].extract_text(), old_text)
        self.assertEqual(len(PdfReader(self.pdf).pages), 2)
        data = json.loads(self.source.read_text(encoding='utf-8'))
        self.assertEqual(data['prompts'], {'old': ['retain']})
        receipt = json.loads(self.receipt.read_text(encoding='utf-8'))
        self.assertEqual(receipt['history'][0]['pdf_sha256'], old_hash)
        self.assertEqual(receipt['pdf_sha256'], evidence.digest(self.pdf))
        self.assertEqual(receipt['source_sha256'], evidence.digest(self.source))

    def test_repeat_is_noop(self):
        self.append()
        before = self.pdf.read_bytes()
        self.append()
        self.assertEqual(self.pdf.read_bytes(), before)

    def test_wrong_month_rejected_without_writes(self):
        before = self.pdf.read_bytes()
        self.assertTrue(callable(getattr(evidence, 'append_daily', None)), 'Cumulative append missing')
        with self.assertRaises(ValueError):
            self.append('2026-10-01')
        self.assertEqual(self.pdf.read_bytes(), before)

    def test_changed_source_rejected_without_writes(self):
        self.source.write_text('{"month":"2026-09"}')
        before = self.pdf.read_bytes()
        self.assertTrue(callable(getattr(evidence, 'append_daily', None)), 'Cumulative append missing')
        with self.assertRaises(ValueError):
            self.append()
        self.assertEqual(self.pdf.read_bytes(), before)
