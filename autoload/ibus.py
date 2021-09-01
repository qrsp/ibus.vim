import vim
import threading

import gi
gi.require_version('IBus', '1.0')
from gi.repository import IBus


class IbusUtil():
    def __init__(self):
        IBus.init()
        self.bus = IBus.Bus()
        self.insert_engines = vim.vars.get('ibus_insert_engines')
        self.normal_engines = vim.vars.get('ibus_normal_engines')

    @staticmethod
    def set_engine(bus, engine):
        bus.set_global_engine(engine)

    def insert(self):
        self.now_engine = self.insert_engines[vim.vars.get('ibus_insert_engines_idx')]
        t = threading.Thread(target = IbusUtil.set_engine, args=(self.bus, self.now_engine))
        t.start()

    def normal(self):
        a = vim.vars.get('ibus_normal_engines_idx')
        self.now_engine = self.normal_engines[a]
        t = threading.Thread(target = IbusUtil.set_engine, args=(self.bus, self.now_engine))
        t.start()

    def focus(self):
        t = threading.Timer(0.5, IbusUtil.set_engine, args=(self.bus, self.now_engine))
        t.start()

ibusUtil = IbusUtil()
